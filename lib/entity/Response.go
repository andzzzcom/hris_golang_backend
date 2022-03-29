package entity

import(
	"github.com/jinzhu/gorm"
)

type Response struct{
	Status		string  		`json:"status"`
	StatusCode	int				`json:"statusCode"`
	Data		*gorm.DB		`json:"data"`
}