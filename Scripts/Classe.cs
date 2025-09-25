using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerStatus : MonoBehaviour
{
    public int VidaMaxima;
    public int Vida;
    public double Dano_Player;
    public int Armadura_Player;
    public double Velocidade_Ataque;
    public double RouboVida;
    public int Level;

    void Start() {
        Vida = VidaMaxima; // inicia com vida cheia
    }
}
