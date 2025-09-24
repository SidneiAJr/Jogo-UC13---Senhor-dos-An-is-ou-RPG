using UnityEngine;
using UnityEngine.Networking;
using System.Collections;

public class ApiTest : MonoBehaviour
{
    IEnumerator Start()
    {
        string url = "http://localhost:3000/player/1"; // rota da tua API
        UnityWebRequest request = UnityWebRequest.Get(url);
        yield return request.SendWebRequest();

        if (request.result == UnityWebRequest.Result.Success)
        {
            Debug.Log("Resposta: " + request.downloadHandler.text);
        }
        else
        {
            Debug.Log("Erro: " + request.error);
        }
    }
}
