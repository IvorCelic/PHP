<?php

class IndexController
{

    private $view;

    public function __construct()
    {
        $this->view = new View();
    }

    public function index()
    {
        $poruka='hello iz kontrolera';
        $kod=22;

       
        $this->view->render('pocetna',[
            'p'=>$poruka,
            'k'=>$kod]
        );


    }
    public function onama()
    {
        $this->view->render('onama');
    }

    public function json()
    {
        $niz=[];
        $s=new stdClass();
        $s->naziv='PHP programiranje';
        $s->sifra=1;
        $niz[]=$s;
        //$this->view->render('onama',$niz);
        echo json_encode($niz);
    }
}