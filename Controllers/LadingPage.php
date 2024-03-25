<?php
class LadingPage extends Controller
{

    public function listarladingModal()
    {
        $data = $this->model->getModallading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingNabvar()
    {
        $data = $this->model->getNabvarlading();
        header('Content-Type: application/json'); // Establece el encabezado Content-Type como JSON
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingSlider()
    {
        $data = $this->model->getSliderlading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingDescripcion()
    {
        $data = $this->model->getInformacionlading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingMonitoreo()
    {
        $data = $this->model->getFuncionesladingMonitoreo();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingControl()
    {
        $data = $this->model->getFuncionesladingControl();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }


    public function listarladingBeneficios()
    {
        $data = $this->model->getBeneficioslading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingCaracteristicas()
    {
        $data = $this->model->getCaracteristicaslading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingVideos()
    {
        $data = $this->model->getVideoslading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function listarladingPreguntas(){
       
        $data = $this->model->getPreguntaslading();
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }

}