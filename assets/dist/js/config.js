function base_url(){
    var base_url = window.location.origin+'/bedah/';
    return base_url;
}

function get_current_date(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = dd+'/'+mm+'/'+yyyy;
	return today;
}

function convertDateHuman(nilai){
	var  mydate = new Date(nilai);
	return mydate;
}

