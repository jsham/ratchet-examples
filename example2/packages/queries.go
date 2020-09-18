package mypkg

import "fmt"

func Query(minId int) string {
	//return fmt.Sprintf(`SELECT id, name FROM users WHERE id >= %v`, minId)
	return fmt.Sprintf(`SELECT id, name, email, phone, job_cd FROM users WHERE id >= %v`, minId)
}
