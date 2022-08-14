
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
          document.getElementById('quantity').value = qty
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
            document.getElementById('quantity').value = qty
   })

  
   

   document.getElementById('fakeCommit').addEventListener('click', e => {
    $('#buyCommit').trigger('click')
   })


