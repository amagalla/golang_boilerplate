package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()

	// Set trusted proxy
	router.SetTrustedProxies([]string{"127.0.0.1"})

	router.GET("/", func(c *gin.Context) {
		fmt.Println("Inside home route!")
		c.String(http.StatusOK, "Hello, Gin!")
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	router.Run(":" + port)
}
