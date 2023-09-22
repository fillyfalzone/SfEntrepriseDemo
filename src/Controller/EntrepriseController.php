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
    public function new(Request $Request, EntityManagerInterface $entityManager): Response
    {
        $entreprise = new Entreprise();
        
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
            'formAddEntreprise' => $form
        ]);
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
