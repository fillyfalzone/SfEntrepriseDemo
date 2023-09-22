<?php

namespace App\Controller;

use App\Entity\Entreprise;
use App\Form\EntrepriseType;
use App\Repository\EntrepriseRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


class EntrepriseController extends AbstractController
{
    #[Route('/entreprise', name: 'app_entreprise')]
    //public function index(EntityManagerInterface $entityManager): Response
    public function index(EntrepriseRepository $entrepriseRepository): Response
    {
        // $entreprises = $entityManager->getRepository(Entreprise::class)->findAll();
        // $entreprises = $entrepriseRepository->findAll();
         // SELECT * FROM entreprise ORDER BY raisonSociale 
         $entreprises = $entrepriseRepository->findBy([], ["raisonSociale" => "ASC"]);
        
        return $this->render('entreprise/index.html.twig', [
           'entreprises' => $entreprises
        ]);
    }
    
    //create new form of compagny CRUD
    #[Route('/entreprise/new', name: 'new_entreprise')]
    #[Route('/entreprise/{id}/edit', name: 'edit_entreprise')]
    public function new_edit(Entreprise $entreprise = null, Request $Request, EntityManagerInterface $entityManager): Response
    {
        // Si l'entreprise n'existe pas on va créer une nouvelle 
        if(!$entreprise){
            $entreprise = new Entreprise();
        }
        //si l'entreprise existe on va recuperer son id et mettre à jours les donnees
        $form = $this->createForm(EntrepriseType::class, $entreprise);
        
        $form->handleRequest($Request);

        if ($form->isSubmitted() && $form->isValid()){

            $entreprise = $form->getData();

            // prepare PDO
            $entityManager->persist($entreprise);
            //execute PDO
            $entityManager->flush();
            
            return $this->redirectToRoute('app_entreprise');
        }


        return $this->render('entreprise/new.html.twig', [
            'formAddEntreprise' => $form,
            'edit' => $entreprise->getId()
        ]);
    }

    #[Route('/entreprise/{id}/delete', name: 'delete_entreprise')]
    public function delete(Entreprise $entreprise, EntityManagerInterface $entityManager)
    {
        $entityManager->remove($entreprise);
        $entityManager->flush();

        return $this->redirectToRoute('app_entreprise');

    }
    
    // show compagny details
    #[Route('/entreprise/{id}', name: 'show_entreprise')]
    public function show(Entreprise $entreprise) : Response 
    {
        return $this->render('entreprise/show.html.twig', [
            'entreprise' => $entreprise
            ]);
    }
    

}    
