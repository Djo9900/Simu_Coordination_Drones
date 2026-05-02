# # Simulation de la coordination de plusieurs drones avec délai de communication

> Projet d'initiation à la recherche — MECAVENIR / LeiCnam 2025–2026  

---

## C'est quoi ce projet ?

Ce projet est né d'une question simple : *est-ce qu'un délai de quelques dixièmes de seconde dans les communications peut vraiment faire perdre le contrôle d'une flotte de drones ?*

La réponse, on l'a découverte par simulation — et elle est plus intéressante qu'on ne le pensait.

L'idée de base, c'est de modéliser plusieurs drones qui essaient de se coordonner entre eux en utilisant une loi de **consensus distribué**. Chaque drone ajuste sa position en fonction de ses voisins, sans aucune supervision centrale. C'est le même principe qu'une nuée d'oiseaux qui volent ensemble sans chef d'orchestre.

On introduit ensuite un délai de communication `τ` — représentant la latence d'un réseau sans fil — et on observe comment le comportement de la flotte évolue.

---

## Ce qu'on fait concrètement

- Modélisation de chaque drone par un **simple intégrateur** `ẋᵢ = uᵢ`
- Implémentation de la **loi de consensus** entre agents
- Simulation sous **MATLAB** (solveurs `ode45` et `dde23`) et **Simulink**
- Analyse de l'effet du délai `τ` sur la stabilité de la coordination
- Identification d'une erreur classique dans la représentation matricielle du délai


---

## Les résultats en bref

| Délai `τ` | Ce qu'on observe |
|---|---|
| `τ = 0 s` | Convergence rapide et stable — tout va bien |
| `τ = 0.5 s` | Légères oscillations au départ, puis stabilisation |
| `τ = 2.5 s` | Oscillations marquées, convergence difficile |
| `τ = 5 s` | Instabilité totale — les drones divergent |

La chose la plus intéressante qu'on a découverte : la représentation matricielle du consensus avec délai est souvent mal écrite. L'équation `Ẋ(t) = -LX(t-τ)` qu'on trouve intuitivement est **incorrecte**, parce qu'elle retarde aussi la position du drone lui-même. La bonne formulation est :

```
Ẋ(t) = A·X(t-τ) - D·X(t)
```

où `A` contient les positions retardées des *voisins*, et `D·X(t)` la position *actuelle* du drone.

---


### Étapes

**1. Consensus sans délai**
```matlab
% Dans MATLAB, lancer directement :
run('matlab/consensus_simple.m')
```

**2. Consensus avec délai**
```matlab
% Modifier la valeur de tau dans le fichier, puis :
run('matlab/consensus_avec_delai.m')
```

**3. Zoom sur un drone avec plusieurs valeurs de τ**
```matlab
run('matlab/zoom_drone1.m')
```

---

## Ce qu'on a utilisé

- **MATLAB** — simulation numérique, solveurs `ode45` et `dde23`
- **Simulink** — schéma bloc en boucle fermée avec `Transport Delay`
- **LaTeX / Overleaf** — rapport et présentation
- **Références principales** :
  - Olfati-Saber, Fax & Murray (2007) — *Consensus and Cooperation in Networked Multi-Agent Systems*
  - Ren & Beard (2008) — *Distributed Consensus in Multi-vehicle Cooperative Control*
  - Maupoux (2023) — *Modélisation de grandes flottes de drones autonomes*

---

## Ce qu'on pourrait améliorer

Ce projet reste une initiation, donc il y a plein de choses qu'on n'a pas eu le temps de faire :

- Passer en **3D** pour se rapprocher d'un cas réel
- Modéliser un délai **variable** dans le temps (plus réaliste pour un réseau Wi-Fi)
- Trouver analytiquement la valeur de `τ_max` au-delà de laquelle le système diverge
- Tester des topologies de communication **dynamiques** (drones qui se perdent de vue)
- Ajouter un **prédicteur de Smith** pour compenser le délai

---

## Auteur

**Siradjo Sy**  
Projet réalisé du 17/02/2026 au 30/04/2026  
  
