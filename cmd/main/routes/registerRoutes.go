package routes

import (
	"golang_boilerplate/cmd/main/routes/sample"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(router *gin.Engine) {
	router.GET("/", sample.LandingPage)
}