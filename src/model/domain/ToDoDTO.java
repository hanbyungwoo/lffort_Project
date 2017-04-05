package model.domain;

public class ToDoDTO {
   String UsrId;
   String TodoType;
   String TodoSdate;
   String TodoEdate;
   String TodoDesc;
   int TodoFlag;
   int TodoCheck;
   
   public ToDoDTO() { }
   
   public ToDoDTO(String usrId, String todoType, String todoSdate, String todoEdate, String todoDesc, int todoFlag,
         int todoCheck) {
      UsrId = usrId;
      TodoType = todoType;
      TodoSdate = todoSdate;
      TodoEdate = todoEdate;
      TodoDesc = todoDesc;
      TodoFlag = todoFlag;
      TodoCheck = todoCheck;
   }
   public String getUsrId() {
      return UsrId;
   }
   public void setUsrId(String usrId) {
      UsrId = usrId;
   }
   public String getTodoType() {
      return TodoType;
   }
   public void setTodoType(String todoType) {
      TodoType = todoType;
   }
   public String getTodoSdate() {
      return TodoSdate;
   }
   public void setTodoSdate(String todoSdate) {
      TodoSdate = todoSdate;
   }
   public String getTodoEdate() {
      return TodoEdate;
   }
   public void setTodoEdate(String todoEdate) {
      TodoEdate = todoEdate;
   }
   public String getTodoDesc() {
      return TodoDesc;
   }
   public void setTodoDesc(String todoDesc) {
      TodoDesc = todoDesc;
   }
   public int getTodoFlag() {
      return TodoFlag;
   }
   public void setTodoFlag(int todoFlag) {
      TodoFlag = todoFlag;
   }
   public int getTodoCheck() {
      return TodoCheck;
   }
   public void setTodoCheck(int todoCheck) {
      TodoCheck = todoCheck;
   }
   
   
}