<?php
// Dados da conexão
$host = "localhost"; 
$usuario = "root"; 
$senha = ""; 
$banco = "kalleotopia";

// Conectar
$conn = new mysqli($host, $usuario, $senha, $banco);

// Testa conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Pega os dados do formulário
$classe = $_POST['classe'];
$nome_usuario = $_POST['nome_usuario'];
$email = $_POST['email'];
$senha_usuario = password_hash($_POST['senha'], PASSWORD_DEFAULT); // senha criptografada

// 1º Insere o usuário
$sql_usuario = "INSERT INTO usuario (nome_usuario, senha, email) 
                VALUES ('$nome_usuario', '$senha_usuario', '$email')";

if ($conn->query($sql_usuario) === TRUE) {
    $id_usuario = $conn->insert_id; // pega o ID do usuário recém criado

    // 2º Pega o id_classe baseado no nome
    $sql_classe = "SELECT id_classe FROM classe WHERE nome_classe = '$classe' LIMIT 1";
    $result = $conn->query($sql_classe);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $id_classe = $row['id_classe'];

        // 3º Cria o personagem associado ao usuário e classe
        $sql_personagem = "INSERT INTO personagem (nome_personagem, dano, info_personagem) 
                           VALUES ('$nome_usuario', 10, 'Personagem inicial')";
        if ($conn->query($sql_personagem) === TRUE) {
            $id_personagem = $conn->insert_id;

            // Relaciona personagem com classe
            $conn->query("INSERT INTO personagem_classe (id_personagem, id_classe) 
                          VALUES ($id_personagem, $id_classe)");

            // Relaciona usuário com personagem
            $conn->query("INSERT INTO usuario_personagem (id_personagem, id_usuario) 
                          VALUES ($id_personagem, $id_usuario)");

            echo "✅ Cadastro realizado com sucesso!";
        } else {
            echo "Erro ao criar personagem: " . $conn->error;
        }
    } else {
        echo "Classe não encontrada!";
    }
} else {
    echo "Erro ao cadastrar usuário: " . $conn->error;
}

$conn->close();
?>
