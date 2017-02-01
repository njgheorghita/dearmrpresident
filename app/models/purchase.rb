class Purchase < ApplicationRecord

  def self.order_letter
    lob.letters.create(
      description: description, 
      to: {
        name: to_name, 
        address_line1: to_address_line, 
        address_state: to_address_state,
        address_city: to_address_city,
        address_country: to_address_country,
        address_zip: to_address_zip
      }, 
      from: {
        name: from_name,
        address_line1: from_address_line,
        address_state: from_address_state,
        address_city: from_address_city,
        address_country: from_address_country,
        address_zip: from_address_zip
      },
      file: file ,
      data: {
        email: data
      },
      color: color 
    )
  end

  def generate_letter
    "<html>
      <head>
      <meta charset='UTF-8'>
      <link href='https://fonts.googleapis.com/css?family=Special+Elite' rel='stylesheet' type='text/css'>
      <style>
        @font-face {
          font-family: 'Loved by the King';
          font-style: normal;
          font-weight: 400;
          src: url('https://s3-us-west-2.amazonaws.com/lob-assets/LovedbytheKing.ttf') format('truetype');
        }
        *, *:before, *:after {
          -webkit-box-sizing: border-box;
          -moz-box-sizing: border-box;
          box-sizing: border-box;
        }
        body {
          width: 8.5in;
          height: 11in;
          margin: 0;
          padding: 0;
          font-family: 'Special Elite', cursive;
        }
        .page {
          page-break-after: always;
        }
        .page-content {
          overflow: hidden;
          position: relative;
          width: 7in;
          height: 10.625in;
          left: 0.75in;
          top: 0.1875in;
          text-align: center;
          margin-left: auto;
          margin-right:auto
        }
        #logo {
          position: absolute;
          top: 0;
          margin-bottom: -100px;
        }
        .wrapper {
          position: absolute;
          top: 2.75in;
        }
        .signature {
          font-family: 'Loved by the King';
          font-size: 45px;
        }
      </style>
      </head>
      <body>
        <div class='page'>
          <div class='page-content'>
            <!-- Your logo here! -->
            <img id='logo' src='http://www.euclidlibrary.org/images/tickle-your-brain/o-american-flag-facebook.jpg?sfvrsn=0'/>

            <div class='wrapper'>
              <p>Dear Mr. President,</p>

              <p><%= %></p>
              <p>Sincerely,</p>
              <p class='signature'>#{ self.description }</p>
            </div>
          </div>
        </div>
      </body>
    </html>"
  end

end
