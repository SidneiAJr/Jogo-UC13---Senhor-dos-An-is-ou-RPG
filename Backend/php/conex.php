<?php
$host = "localhost"; // ou 127.0.0.1
$usuario = "root";   // teu usuário do MySQL
$senha = "";         // tua senha do MySQL (coloca se tiver)
$banco = "kalleotopia";

$conn = new mysqli($host, $usuario, $senha, $banco);

// Testa se deu erro
if ($conn->connect_error) {
    die("Erro de conexão: " . $conn->connect_error);
} else {
    echo "Conectado com sucesso ao banco: " . $banco;
}
?>
