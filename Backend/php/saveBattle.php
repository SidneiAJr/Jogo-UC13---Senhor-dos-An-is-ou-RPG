<?php
header('Content-Type: application/json');
include_once '../db/db.php';

// Recebendo os dados da requisição POST
$data = json_decode(file_get_contents("php://input"));

if (isset($data->idPersonagem) && isset($data->idMob) && isset($data->resultado) && isset($data->xpGanho)) {
    // Extraindo os dados
    $idPersonagem = $data->idPersonagem;
    $idMob = $data->idMob;
    $resultado = $data->resultado;
    $xpGanho = $data->xpGanho;

    // Preparando a consulta SQL para inserir o resultado da batalha
    $query = "INSERT INTO batalhas (id_personagem, id_mob, resultado, xp_ganho) VALUES (:idPersonagem, :idMob, :resultado, :xpGanho)";

    try {
        // Preparando a execução da consulta
        $stmt = $pdo->prepare($query);

        // Bindando os parâmetros
        $stmt->bindParam(':idPersonagem', $idPersonagem, PDO::PARAM_INT);
        $stmt->bindParam(':idMob', $idMob, PDO::PARAM_INT);
        $stmt->bindParam(':resultado', $resultado, PDO::PARAM_STR);
        $stmt->bindParam(':xpGanho', $xpGanho, PDO::PARAM_INT);

        // Executando a consulta
        if ($stmt->execute()) {
            echo json_encode(['status' => 'success', 'message' => 'Batalha registrada com sucesso!']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Erro ao registrar a batalha']);
        }
    } catch (PDOException $e) {
        echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
    }
} else {
    // Caso falte algum parâmetro
    echo json_encode(['status' => 'error', 'message' => 'Dados incompletos']);
}
?>
