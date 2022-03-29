package db

import(
	"github.com/jinzhu/gorm"
	"fmt"
)

func ConnectDB() *gorm.DB {
	var USERNAME	 = "root"
	var PASSWORD	 = ""
	var HOST		 = "localhost:3306"
	var DB			 = "golang_hris"
	connectionString := fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8&parseTime=True", USERNAME, PASSWORD, HOST, DB)
	
	db, err := gorm.Open("mysql", connectionString)
    if err!=nil{
		panic(err.Error())
	}
	return db
}