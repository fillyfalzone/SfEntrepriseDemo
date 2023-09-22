<?php

namespace App\Controller;

use App\Entity\Employe;
use App\Form\EmployeType;
use App\Repository\EmployeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class EmployeController extends AbstractController
{
    #[Route('/employe', name: 'app_employe')]
    public function index(EmployeRepository $employeRepository): Response
    {   
        // $employes = $employeRepository->findAll();
        // SELECT * FROM employe ORDER BY raisonSociale 
        $employes = $employeRepository->findBy([], ["prenom" => "ASC"]);
        return $this->render('employe/index.html.twig', [
            'employes' => $employes
        ]);
    }

     //create new form of employe CRUD
     #[Route('/employe/new', name: 'new_employe')]
     #[Route('/employe/{id}/edit', name: 'edit_employe')]
     public function new_edit(Employe $employe = null, Request $Request, EntityManagerInterface $entityManager): Response
     {
        // Si l'employé n'existe pas on va créer une nouvelle 
        if (!$employe){

            $employe = new Employe();
        } 
        
        //si l'employé existe on va recuperer son id et mettre à jours les donnees
        $form = $this->createForm(EmployeType::class, $employe);
        $form->handleRequest($Request);

        if ($form->isSubmitted() && $form->isValid()){

            $employe = $form->getData();

            // prepare PDO
            $entityManager->persist($employe);
            //execute PDO
            $entityManager->flush();
            
            return $this->redirectToRoute('app_employe');
        }
        
        return $this->render('employe/new.html.twig', [
            'formAddEmploye' => $form,
            'edit' => $employe->getId()
        ]);
    }

    #[Route('/employe/{id}/delete', name: 'delete_employe')]
    public function delete(Employe $employe, EntityManagerInterface $entityManager)
    {
        
        $entityManager->remove($employe);
        $entityManager->flush();

        return $this->redirectToRoute('app_employe');
    }

    #[Route('/employe/{id}', name: 'show_employe')]
    public function show(Employe $employe) : Response
    {
        return $this->render('employe/show.html.twig', [
            'employe' => $employe
        ]);
    }
}
