/* globals Chart:false, feather:false */

// (function () {
//     'use strict'
  
//     feather.replace({ 'aria-hidden': 'true' })
  
//     // Graphs
//     var ctx = document.getElementById('myChart')
//     // eslint-disable-next-line no-unused-vars
//     var myChart = new Chart(ctx, {
//       type: 'line',
//       data: {
//         labels: [
//           'Sunday',
//           'Monday',
//           'Tuesday',
//           'Wednesday',
//           'Thursday',
//           'Friday',
//           'Saturday'
//         ],
//         datasets: [{
//           data: [
//             15339,
//             21345,
//             18483,
//             24003,
//             23489,
//             24092,
//             12034
//           ],
//           lineTension: 0,
//           backgroundColor: 'transparent',
//           borderColor: '#007bff',
//           borderWidth: 4,
//           pointBackgroundColor: '#007bff'
//         }]
//       },
//       options: {
//         scales: {
//           yAxes: [{
//             ticks: {
//               beginAtZero: false
//             }
//           }]
//         },
//         legend: {
//           display: false
//         }
//       }
//     })
//   })()
  
// const th = document.querySelectorAll('th')  

// th.forEach(e => {
//   e.addEventListener('click',el => {
//     const table = el.target.parentElement.parentElement.parentElement
//     const sortParent = el.target.parentElement
//     const sortBy = el.target.textContent

//     const th = sortParent.querySelectorAll('th')

//     th.forEach((ele,i) => {
//       if(sortBy == ele.textContent) {
//         sortTable(table,i)
//       }
//     })



//   })
// })

// function sortTable(table,sortBy) {
// const tr =  table.querySelectorAll('tr')

// const arr = []
// const arrData = []
  
//   tr.forEach((e,i) => {
//     if(i != 0) {
//     arr.push(e)
//    }
//   })

//   arr.forEach(data => {
//     const tdArrData = []
//     const td = data.querySelectorAll('td')
//     td.forEach(t => {
//       tdArrData.push(t.textContent)
//     })
//     arrData.push(tdArrData)
//   })

//   console.log(arrData)
  
// }

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


const cellVal = (tr, idx) => tr.children[idx].innerText || tr.children[idx].textContent;

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


      function myFunction() {
        console.log('test')
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[0];
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