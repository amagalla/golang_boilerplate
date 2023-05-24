package main

import (
	"golang_boilerplate/pckg/db"
	"net/http"
	"os"

	"github.com/gin-gonic/gin"
)

func main() {

	// mysql connection
	db.InitDB()

	router := gin.Default()

	// Set trusted proxy
	router.SetTrustedProxies([]string{"127.0.0.1"})

	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello, World!",
		})
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "3000"
	}

	router.Run(":" + port)
}
