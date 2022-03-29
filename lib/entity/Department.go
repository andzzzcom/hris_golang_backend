package entity

type C_department struct{
	Id_department      	int    `json:"id_department";gorm:"primaryKey"`
	Name	  			string `json:"name"`
	Status_active  		int    `json:"status_active"`
	Creator	  			int    `json:"creator"`
	Last_updater   		int    `json:"last_updater"`
	Created_date	 	string `json:"created_date"`
	Last_updated   		string `json:"last_updated"`
}