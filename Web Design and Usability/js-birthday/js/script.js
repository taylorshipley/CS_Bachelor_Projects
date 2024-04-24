function birthday(){
    var name = window.prompt("Please enter your full name","John Doe")
    var DOB = window.prompt("Enter your date of birth (MM/DD/YYYY)","01/01/2000")
    var DOBarray = DOB.split('/');
    var month = parseInt(DOBarray[0]);
    var day = parseInt(DOBarray[1]);
    var year = parseInt(DOBarray[2]);
	var birthstone;
    switch(month)
	{
        case 1:
            month = "January";
			birthstone = "Garnet";
            break;
        case 2:
            month = "February";
			birthstone = "Amethyst";
            break;
        case 3:
            month = "March";
			birthstone = "Aquamarine";
            break;
        case 4:
            month = "April";
			birthstone = "Diamond";
            break;
        case 5:
            month="May";
			birthstone = "Emerald";
            break;
        case 6:
            month = "June";
			birthstone = "Pearl";
            break;
        case 7:
            month = "July";
			birthstone = "Ruby";
            break;
        case 8:
            month = "August";
			birthstone = "Peridot";
            break;
        case 9:
            month = "September";
			birthstone = "Saphire";
            break;
        case 10:
            month = "October";
			birthstone = "Opal";
            break;
        case 11:
            month = "November";
			birthstone = "Topaz";
            break;
        case 12:
            month = "December";
			birthstone = "Turquoise";
            break;
        default:
            alert("Problem with the date of birth entered ");
    }
    var age = new Date().getFullYear()-DOBarray[2];

    alert("Hello " + name + "." + " You are " + age +" years old! You were born in " + month + " which means your birthstone is " + birthstone + ".");
    document.getElementById("add").innerHTML += "<h2>Hi " + name + ", welcome to my website.</h2>";
}