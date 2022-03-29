package main

import(
	"log"
	"net/http"
	"github.com/gorilla/mux"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	controllers "hris_backend_golang/lib/controllers"
)

func main(){
	log.Println("Starting the HTTP server on port 8090")

	router := mux.NewRouter().StrictSlash(true)
	initalizeHandlers(router)
	log.Fatal(http.ListenAndServe(":8090", router))
}

func initalizeHandlers(router *mux.Router){
	router.HandleFunc("/api/v1/employees", controllers.GetAllEmployees).Methods("GET")
	router.HandleFunc("/api/v1/employees/show/{id}", controllers.GetEmployeeById).Methods("GET")
	router.HandleFunc("/api/v1/employees/create", controllers.CreateNewEmployee).Methods("POST")
	router.HandleFunc("/api/v1/employees/update", controllers.UpdateNewEmployee).Methods("PUT")
	router.HandleFunc("/api/v1/employees/delete", controllers.RemoveNewEmployee).Methods("PUT")
	
	router.HandleFunc("/api/v1/designations", controllers.GetAllDesignation).Methods("GET")
	router.HandleFunc("/api/v1/designations/show/{id}", controllers.GetDesignationById).Methods("GET")
	router.HandleFunc("/api/v1/designations/create", controllers.CreateNewDesignation).Methods("POST")
	router.HandleFunc("/api/v1/designations/update", controllers.UpdateNewDesignation).Methods("PUT")
	router.HandleFunc("/api/v1/designations/delete", controllers.RemoveNewDesignation).Methods("PUT")
	
	router.HandleFunc("/api/v1/departments", controllers.GetAllDepartment).Methods("GET")
	router.HandleFunc("/api/v1/departments/show/{id}", controllers.GetDepartmentById).Methods("GET")
	router.HandleFunc("/api/v1/departments/create", controllers.CreateNewDepartment).Methods("POST")
	router.HandleFunc("/api/v1/departments/update", controllers.UpdateNewDepartment).Methods("PUT")
	router.HandleFunc("/api/v1/departments/delete", controllers.RemoveNewDepartment).Methods("PUT")

	router.HandleFunc("/api/v1/admins", controllers.GetAllAdmin).Methods("GET")
	router.HandleFunc("/api/v1/admins/show/{id}", controllers.GetAdminById).Methods("GET")
	router.HandleFunc("/api/v1/admins/create", controllers.CreateNewAdmin).Methods("POST")
	router.HandleFunc("/api/v1/admins/update", controllers.UpdateNewAdmin).Methods("PUT")
	router.HandleFunc("/api/v1/admins/delete", controllers.RemoveNewAdmin).Methods("PUT")
	
	router.HandleFunc("/api/v1/settings", controllers.GetSettingGeneral).Methods("GET")
	router.HandleFunc("/api/v1/settings/update", controllers.UpdateSettingGeneral).Methods("PUT")
	
	router.HandleFunc("/api/v1/login", controllers.AdminLogin).Methods("POST")
}