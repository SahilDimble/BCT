// SPDX-License-Identifier: MIT

pragma solidity >0.7.0 <0.9.0;

contract Student_Management{
    struct Student{
        int stud_id;
        string name;
        string department;
    }
    Student[] Students;

    function add_student(int stud_id, string memory name, string memory department) public{
        Student memory stud =Student(stud_id,name,department);
        Students.push(stud);
    }

    function get_student(int stud_id) public view returns(string memory, string memory){
        for(uint i =0; i < Students.length ;i++){
            Student memory stud = Students[i];
            if(stud.stud_id==stud_id){
                return (stud.name,stud.department);
            }
        }
        return ("Name not found", "department not found");
    }

}