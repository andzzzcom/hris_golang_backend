package entity

type C_settings struct{
	Id_setting	      	int    `json:"id_setting";gorm:"primaryKey"`
	Title_web  			string `json:"title_web"`
	Subtitle_web		string `json:"subtitle_web"`
	Favicon_web			string `json:"favicon_web"`
	Logo_web 			string `json:"logo_web"`
}