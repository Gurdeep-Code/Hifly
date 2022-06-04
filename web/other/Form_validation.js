function registerVALID() {
var name = document.getElementById("Name").value;
var email = document.getElementById("Email").value;
var phone = document.getElementById("Phone").value;
var phonespace = document.getElementById("Phone").value.indexOf(" ");
var pwd = document.getElementById("pwd").value;
var at = document.getElementById("Email").value.indexOf("@");
var emailspace = document.getElementById("Email").value.indexOf(" ");
var iChars = "!`@#$%^&*()+=-[]\\\';,./{}|\":<>?~_";
var res = phone.match(/[0-9]/g);
var res1 = phone.match(/[a-z]/gi);
var Nres = name.match(/[0-9]/g);
var Nres1 = name.match(/[a-z]/gi);
var flag = 1;
var flag1 = 1;

//Empty field validation

if (name == "" || name == null) {
  document.getElementById("Name").style.transition = "0.7s";
  document.getElementById("Name").style.border = "1px solid red";
  flag = 0;  
}
else{
  nameValid();  
}


if (email == "" || email == null) {
  document.getElementById("Email").style.transition = "0.7s";
  document.getElementById("Email").style.border = "1px solid red";
  flag = 0; 
}
else{
  emailValid(); 
}


if (phone == "" || phone == null) {
  document.getElementById("Phone").style.transition = "0.7s";
  document.getElementById("Phone").style.border = "1px solid red";
  flag = 0;
}
else{
  phoneValid();
}


if (pwd == "" || pwd == null) {
  document.getElementById("pwd").style.transition = "0.7s";
  document.getElementById("pwd").style.border = "1px solid red";
  flag = 0; 
}
else{
  passValid();
}



//------------final check for transfering control to servlet------------
if (flag == 0) {
  document.getElementById("invalidMSG").innerHTML = "Information must be filled out.";
  return false;
}

//------------final check for transfer control to servlet------------
if (flag1 == 0){
  document.getElementById("invalidMSG").innerHTML = "Not a valid input.";
    return false;
}
else
{
document.getElementById("registerForm").action = "RegisterPageServlet";
document.getElementById("registerForm").method = "post";   
}


//---------------------------------validation function-----------------------------------

//------------name validation------------
function nameValid(){
if(Nres1 == null|| Nres != null){
  document.getElementById("Name").style.transition = "0.7s";
  document.getElementById("Name").style.border = "1px solid red";
  flag1 = 0;
  }
  else
  {
    for (var i = 0; i < name.length; i++)
    {      

      if (iChars.indexOf(name.charAt(i)) != -1)

      {    
        document.getElementById("Name").style.transition = "0.7s";
        document.getElementById("Name").style.border = "1px solid red";
        flag1 = 0;
        break;
      } 
      else{
        document.getElementById("Name").style.transition = "0.7s";
        document.getElementById("Name").style.border = "1px solid green";  
        document.getElementById("invalidMSG").innerHTML = " ";}

    } 
  }
}

//------------email validation------------
function emailValid(){
  if (at > 0 && emailspace == -1) {
    document.getElementById("Email").style.transition = "0.7s";
    document.getElementById("Email").style.border = "1px solid green";  
    document.getElementById("invalidMSG").innerHTML = " ";
    }
    else{
      document.getElementById("Email").style.transition = "0.7s";
      document.getElementById("Email").style.border = "1px solid red";
      flag1 = 0;
    }
}


//------------phone no. validation------------
function phoneValid(){
  if(res == null || res1 != null){
    document.getElementById("Phone").style.transition = "0.7s";
    document.getElementById("Phone").style.border = "1px solid red";
    flag1 = 0;
    }
    else
    {
    if(phone.length == 10 && phonespace == -1)
    {
      for (var i = 0; i < 10; i++)
      {      
  
        if (iChars.indexOf(phone.charAt(i)) != -1)
  
        {   
          document.getElementById("Phone").style.transition = "0.7s";
          document.getElementById("Phone").style.border = "1px solid red";
          flag1 = 0;
          break;
        } 
        else{
          document.getElementById("Phone").style.transition = "0.7s";
          document.getElementById("Phone").style.border = "1px solid green";  
          document.getElementById("invalidMSG").innerHTML = " ";}
  
      }
    }
    else{
    document.getElementById("Phone").style.border = "1px solid red";
    flag1 = 0;}
    } 
}


//------------password validation------------
function passValid(){
if (pwd.length < 8) {
  document.getElementById("pwd").style.transition = "0.7s";
  document.getElementById("pwd").style.border = "1px solid red";
  flag1 = 0;
  }
  else{
  document.getElementById("pwd").style.transition = "0.7s";
  document.getElementById("pwd").style.border = "1px solid green";
  document.getElementById("invalidMSG").innerHTML = " ";  
  } 
}

}


function nameNOTE() {
  document.getElementById("invalidMSG").innerHTML = "Name should be in alphabet only.";
}


function emailNOTE() {
  document.getElementById("invalidMSG").innerHTML = "Use of @ is mandatory.";
}


function phoneNOTE() {
  document.getElementById("invalidMSG").innerHTML = "It should require 10 numeric values.";
}


function passNOTE() {
  document.getElementById("invalidMSG").innerHTML = "It must be of minimum 8 characters.";
}



function loginVALID() {
  var email = document.getElementById("LEmail").value;
  var pwd = document.getElementById("LPwd").value;
  var at = document.getElementById("LEmail").value.indexOf("@");
  var emailspace = document.getElementById("LEmail").value.indexOf(" ");
  var flag = 1;
  var flag1 = 1;

  
  //Empty field validation

  if (email == "" || email == null) {
    document.getElementById("LEmail").style.transition = "0.7s";
    document.getElementById("LEmail").style.border = "1px solid red";
    flag = 0; 
  }
  else{
    emailValid(); 
  }
  
  if (pwd == "" || pwd == null) {
    document.getElementById("LPwd").style.transition = "0.7s";
    document.getElementById("LPwd").style.border = "1px solid red";
    flag = 0; 
  }
  else{
    passValid();
  }
  
  
  
  //------------final check for transfering control to servlet------------
  if (flag == 0) {
    document.getElementById("invalidMSG1").innerHTML = "Information must be filled out.";
    return false;
  }

  //------------final check for transfer control to servlet------------
if (flag1 == 0){
  document.getElementById("invalidMSG1").innerHTML = "Not a valid input.";
    return false;
}
else
{
document.getElementById("loginForm").action = "LoginPageServlet";
document.getElementById("loginForm").method = "post";  
}


  
  //------------email validation------------
function emailValid(){
  if (at > 0 && emailspace == -1) {
    document.getElementById("LEmail").style.transition = "0.7s";
    document.getElementById("LEmail").style.border = "1px solid green";  
    }
    else{
      document.getElementById("LEmail").style.transition = "0.7s";
      document.getElementById("LEmail").style.border = "1px solid red";
      flag1 = 0;
    }
}



//------------password validation------------
function passValid(){
if (pwd.length < 8) {
  document.getElementById("LPwd").style.transition = "0.7s";
  document.getElementById("LPwd").style.border = "1px solid red";
  flag1 = 0;
  }
  else{
  document.getElementById("LPwd").style.transition = "0.7s";
  document.getElementById("LPwd").style.border = "1px solid green"  
  } 
}

}


