package mypkg

import "fmt"

func Query(minId int) string {
	queryStr := fmt.Sprintf(`SELECT id, name, email, phone, job_cd FROM users WHERE id >= %v`, minId)
	fmt.Println("queryStr: ", queryStr)
	return queryStr
}
