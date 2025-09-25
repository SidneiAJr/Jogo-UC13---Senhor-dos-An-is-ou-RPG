<?php
header('Content-Type: application/json');
include_once '../db/db.php';

// Consulta SQL para pegar todas as classes
$query = "SELECT * FROM classe";

try {
    $stmt = $pdo->prepare($query);
    $stmt->execute();

    // Retorna as classes como um array associativo
    $classes = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Se houver classes, retornamos elas, senão retornamos uma lista vazia
    if ($classes) {
        echo json_encode(['status' => 'success', 'data' => $classes]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Nenhuma classe encontrada']);
    }
} catch (PDOException $e) {
    // Caso ocorra algum erro na consulta
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>
