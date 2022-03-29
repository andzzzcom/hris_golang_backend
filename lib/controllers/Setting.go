package controllers

import(
	"net/http"
	"encoding/json"
	database "hris_backend_golang/lib/db"
	entity "hris_backend_golang/lib/entity"
)

func GetSettingGeneral(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()

	setting		:= db.Where("id_setting=?", 1).Find(&[]entity.C_settings{})
	result		:= entity.Response{
		"success",
		200,
		setting,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&result)

}

func UpdateSettingGeneral(w http.ResponseWriter, r *http.Request){
	db			:= database.ConnectDB()
	
	var set entity.C_settings
    json.NewDecoder(r.Body).Decode(&set)
	
    db.Model(&entity.C_settings{}).Where("id_setting=?", set.Id_setting).Updates(set)

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(set)
}