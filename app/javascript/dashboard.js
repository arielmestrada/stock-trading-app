/* globals Chart:false, feather:false */

(function () {
    'use strict'
  
    feather.replace({ 'aria-hidden': 'true' })
  
    // Graphs
    var ctx = document.querySelectorAll('canvas').forEach(el => {
    // eslint-disable-next-line no-unused-vars
    var myChart = new Chart(el, {
      type: 'line',
      data: {
        labels: [
          'Sunday',
          'Monday',
          'Tuesday',
          'Wednesday',
          'Thursday',
          'Friday',
          'Saturday'
        ],
        datasets: [{
          data: [
            Math.random()*50000,
            Math.random()*50000,
            Math.random()*50000,
            Math.random()*50000,
            Math.random()*50000,
            Math.random()*50000,
            Math.random()*50000
          ],
          lineTension: 0,
          backgroundColor: 'transparent',
          borderColor: '#007bff',
          borderWidth: 4,
          pointBackgroundColor: '#007bff'
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: false
            }
          }]
        },
        legend: {
          display: false
        }
      }
    })
  })
  })()

document.querySelectorAll('th').forEach(e => {

  e.addEventListener('mouseover',el => {
   // <i class="fa-solid fa-sort"></i>
    const i = document.createElement('i')
    i.setAttribute('id','sortIcon')
    i.setAttribute('class','fa-solid fa-sort' )
   el.target.appendChild(i)
  })
 // 

 e.addEventListener('mouseout',el => {
  // <i class="fa-solid fa-sort"></i>

  document.getElementById('sortIcon').remove()

 })



})


try {

function cellVal(tr,idx) {
  return tr.children[idx].innerText.replace('$','') || tr.children[idx].textContent.replace('$','')
}

  const matchCompare = (idx, asc) => (a, b) => ((v1, v2) => 
    v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
    )(cellVal(asc ? a : b, idx), cellVal(asc ? b : a, idx));

 

// do the work...
document.querySelectorAll('th').forEach(th => th.addEventListener('click', (() => {
    const table = th.closest('table');
    Array.from(table.querySelectorAll('tr:nth-child(n+2)'))
        .sort(matchCompare(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
        .forEach(tr => table.appendChild(tr) );

        z = table.querySelectorAll('tr')
        z.forEach((el,i) => {

          if(i % 2 == 0) {
            el.style.backgroundColor = '#f2f2f2'
          } else {
            el.style.backgroundColor = '#fff'
          }

          if(i != 0) {
            el.querySelectorAll('td').forEach((td,iz) => {
            
              td.style.padding = '4px 3px'

            })
        }
        })
        }))

      );

    } catch (error) {
      
    }



      function myFunction() {
        const url = window.location.href
        let index = 0;

        switch (true) {
          case url.includes('trader/transactions') ||  url.includes('/listings'):
            index = 1;
            break;
        
          default:
            break;
        }


        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[index];
          if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          }       
        }

     }




     document.getElementById('buyCommit')