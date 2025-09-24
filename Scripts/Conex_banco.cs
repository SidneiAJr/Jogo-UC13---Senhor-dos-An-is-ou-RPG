using UnityEngine;
using UnityEngine.Networking;
using System.Collections;

[System.Serializable]
public class PlayerData {
    public int VidaMaxima;
    public int Vida;
    public double Dano_Player;
    public int Armadura_Player;
    public double Velocidade_Ataque;
    public double RouboVida;
    public int Level;
}

public class PlayerStatus : MonoBehaviour
{
    public PlayerData data;

    void Start() {
        StartCoroutine(GetPlayerData());
    }

    IEnumerator GetPlayerData() {
        string url = "http://localhost:3006/api/player/1"; // exemplo de rota
        UnityWebRequest request = UnityWebRequest.Get(url);

        yield return request.SendWebRequest();

        if (request.result == UnityWebRequest.Result.Success) {
            data = JsonUtility.FromJson<PlayerData>(request.downloadHandler.text);
            Debug.Log("Player carregado: " + data.VidaMaxima);
        } else {
            Debug.LogError("Erro ao carregar player: " + request.error);
        }
    }
}
