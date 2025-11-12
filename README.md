
# WordsPlay

TinyWordGames is an engaging multiplayer word game that combines the thrill of real-time battles with the challenge of word creation. This project utilizes Golang for the backend server, Vue.js for the frontend application, WebSocket for real-time communication, and Docker for easy deployment.

## Tech Stack  
![Go](https://img.shields.io/badge/go-%2300ADD8.svg?style=for-the-badge&logo=go&logoColor=white) ![Vue.js](https://img.shields.io/badge/vuejs-%2335495e.svg?style=for-the-badge&logo=vuedotjs&logoColor=%234FC08D) ![Vuetify](https://img.shields.io/badge/Vuetify-1867C0?style=for-the-badge&logo=vuetify&logoColor=AEDDFF) ![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) 	![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) 

## Features

- **Real-time Battles:** Challenge your friends or random opponents to fast-paced word battles.
- **WebSocket Integration:** Enjoy seamless and instant communication between players for a responsive gaming experience.
- **Golang Backend:** Utilizes the power of Golang to handle server-side logic efficiently.
- **Vue.js Frontend:** A dynamic and interactive user interface designed with Vue.js for a smooth gaming experience.
- **Dockerized Multistaged Deployment:** Easily deploy and manage the application using Docker containers which are small and lightweight.

## SockIt

Wordsplay uses sockit package for better rooms, events and message [link](https://github.com/pregadez/sockit)

## Architecture  
```mermaid
    graph TD

    A[Vue Client]

    subgraph B[Go Server]
        C[HTTP Server]
        E[Client Reader - Concurrent]
        F[Client Writer - Concurrent]
        D[WebSocket Upgrader]
        G[Game Server]
    end

    subgraph H[Room Server]
        Hnote["Manages rooms and clients<br/>Handles lobby for random room creation"]
    end

    subgraph I[Game State Manager]
        Inote["Processes game logic<br/>Updates game state<br/>Sends periodic state updates to clients"]
    end

    A --> B
    B --> C
    B --> D
    D --> E
    D --> F
    B --> G
    G --> H
    E --> G
    G --> F
    B --> H
    E --> H
    H --> F
    F --> A
    H <--> I
    H -.->|Game state updates via ticker| F
```

## Project Setup
wordsplay uses Docker for deployment and project creation you can find docker-compose.yaml  in repo .

```
git clone git@github.com:pregadez/wordsplay.git
cd tinywordgames

docker-compose build
docker-compose up
```

## Authors

- [@Pragadeesh S.](https://www.github.com/pregadez)


