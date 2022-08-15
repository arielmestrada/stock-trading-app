
     document.querySelectorAll('.qty-btn').forEach(e => {
      
        e.addEventListener('click', el => {
          const qty = document.getElementById('form1').value
          let price = document.getElementById('staticPrice').textContent
          price = price.replace( /^\D+/g, '')
          price = +price
          price = price * qty
          let money = Intl.NumberFormat('en-US', {
            style: "currency",
            currency: "USD",
            useGrouping: true,
          })
          document.getElementById('front-price').textContent = money.format(price)
          document.getElementById('stock_quantity').value = qty

          if(new URLSearchParams(window.location.search).get('notice') == 'Insufficient Balance') {
            document.getElementById('fundsError').classList.remove("d-flex");
            document.getElementById('fundsError').classList.add("d-none");
        
          }


      }) 
   })

  
   document.getElementById('form1').addEventListener('change', el => {
            const qty = document.getElementById('form1').value
            let price = document.getElementById('staticPrice').textContent
            price = price.replace( /^\D+/g, '')
            price = +price
            price = price * qty
            let money = Intl.NumberFormat('en-US', {
              style: "currency",
              currency: "USD",
              useGrouping: true,
            })
            document.getElementById('front-price').textContent = money.format(price)
            document.getElementById('stock_quantity').value = qty
            if(new URLSearchParams(window.location.search).get('notice') == 'Insufficient Balance') {
              document.getElementById('fundsError').classList.remove("d-flex");
              document.getElementById('fundsError').classList.add("d-none");
          
            }
  
   })

  
   

   document.getElementById('fakeCommit').addEventListener('click', e => {
    $('#buyCommit').trigger('click')
   })



   if(new URLSearchParams(window.location.search).get('notice') == 'Insufficient Balance') {
    document.getElementById('fundsError').classList.remove("d-none");
    document.getElementById('fundsError').classList.add("d-flex");

  }