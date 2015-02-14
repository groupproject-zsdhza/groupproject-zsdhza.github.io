$(document).ready(function(){
  $.getJSON("StudentInformation.json", function(sad){
        var arr1 = [sad[1].GPA,sad[2].GPA,sad[3].GPA,sad[4].GPA,sad[5].GPA,sad[6].GPA,sad[7].GPA,sad[8].GPA,sad[9].GPA,sad[0].GPA];
        var arr2 = [sad[1].GRE_V,sad[2].GRE_V,sad[3].GRE_V,sad[4].GRE_V,sad[5].GRE_V,sad[6].GRE_V,sad[7].GRE_V,sad[8].GRE_V,sad[9].GRE_V,sad[0].GRE_V];
		var arr3 = [sad[1].GRE_Q,sad[2].GRE_Q,sad[3].GRE_Q,sad[4].GRE_Q,sad[5].GRE_Q,sad[6].GRE_Q,sad[7].GRE_Q,sad[8].GRE_Q,sad[9].GRE_Q,sad[0].GRE_Q];
		var arr4 = [sad[1].Essay,sad[2].Essay,sad[3].Essay,sad[4].Essay,sad[5].Essay,sad[6].Essay,sad[7].Essay,sad[8].Essay,sad[9].Essay,sad[0].Essay];
		var arr5 = [sad[1].Recom,sad[2].Recom,sad[3].Recom,sad[4].Recom,sad[5].Recom,sad[6].Recom,sad[7].Recom,sad[8].Recom,sad[9].Recom,sad[0].Recom];
		
		var Min1 = Math.min.apply(null, arr1);
		var Min2 = Math.min.apply(null, arr2);
		var Min3 = Math.min.apply(null, arr3);
		var Min4 = Math.min.apply(null, arr4);
		var Min5 = Math.min.apply(null, arr5);
        var c=[];
        var i=0;
        while (i <= arr1.length) {
          c = $("<tr>");
          c.append("<td>" + sad[i].Name + "</td>");
          if(sad[i].GPA==Min1){c.append("<td id='change_color'>" + sad[i].GPA + "</td>")}
          else{c.append("<td>" + sad[i].GPA + "</td>");}
          
		  if(sad[i].GRE_V==Min2){c.append("<td id='change_color'>" + sad[i].GRE_V + "</td>")}
          else{c.append("<td>" + sad[i].GRE_V + "</td>");}
		  
		  if(sad[i].GRE_Q==Min3){c.append("<td id='change_color'>" + sad[i].GRE_Q + "</td>")}
          else{c.append("<td>" + sad[i].GRE_Q + "</td>");}
		  
		  if(sad[i].Essay==Min4){c.append("<td id='change_color'>" + sad[i].Essay + "</td>")}
          else{c.append("<td>" + sad[i].Essay + "</td>");}
		  
		  if(sad[i].Recom==Min5){c.append("<td id='change_color'>" + sad[i].Recom + "</td>")}
          else{c.append("<td>" + sad[i].Recom + "</td>");}
      
        
            $('#information_table').append(c); 
      i++;
     }
})})