package entity

type C_employee struct{
	Id_employee        	int    `json:"id_employee";gorm:"primaryKey"`
	Id_designation		int	   `json:"id_designation"`
	Name	  			string `json:"name"`
	Email       		string `json:"email"`
	Born_date 			string `json:"born_date"`
	Photo       		string `json:"photo"`
	Gender	  			int	   `json:"gender"`
	Phone       		string `json:"phone"`
	Address	  			string `json:"address"`
	Salary       		string `json:"salary"`
	Status_active  		int    `json:"status_active"`
	Creator	  			int    `json:"creator"`
	Last_updater   		int    `json:"last_updater"`
	Created_date	 	string `json:"created_date"`
	Last_updated   		string `json:"last_updated"`
}