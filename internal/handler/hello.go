package handler

import (
	"net/http"

	rs "github.com/pregadez/wordsplay/pkg"
)

type HelloMessage struct {
	Description string `json:"description"`
}

func (app *App) HelloHandler(w http.ResponseWriter, r *http.Request) {
	type messages []HelloMessage
	res := messages{
		HelloMessage{Description: "WordsPlay❤"},
		HelloMessage{Description: "Welcome to coolest project ever"},
	}

	rs.RespondwithJSON(w, http.StatusOK, res)
}
