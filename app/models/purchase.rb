class Purchase < ApplicationRecord
  validates :letter_id, :description, 
            :to_name, :to_address_line, :to_address_city, :to_address_state, :to_address_country, :to_address_zip, 
            :from_name, :from_address_line, :from_address_city, :from_address_state, :from_address_country, :from_address_zip, 
            :file, :data, :payment_status, :color, presence: true
            
  belongs_to :letter

  STATES = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS",
            "KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY",
            "NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV",
            "WI","WY"]

  def order_letter(lob, politician)
    lob.letters.create(
      description:        self.description, 
      to: {
        name:             politician[:name], 
        address_line1:    politician[:address_line], 
        address_state:    politician[:address_state],
        address_city:     politician[:address_city],
        address_country:  politician[:address_country],
        address_zip:      politician[:address_zip]
      }, 
      from: {
        name:             self.from_name,
        address_line1:    self.from_address_line,
        address_state:    self.from_address_state,
        address_city:     self.from_address_city,
        address_country:  self.from_address_country,
        address_zip:      self.from_address_zip
      },
      file:               self.generate_letter,
      data: {
        email:            self.data
      },
      color:              self.color 
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
        }
        
        .page {
          page-break-after: always;
          overflow: hidden;
          border: 2px solid black;
          border-radius: 5px;
        }
        .page-content {
          position: relative;
          width: 7in;
          height: 10.625in;
          left: 0.5in;
          text-align: center;
          margin-left: auto;
          margin-right:auto;
        }
        #logo {
          position: absolute;
          top: 0;
          margin-bottom: -100px;
          margin-left: 70px;
        }
        .wrapper {
          position: relative;
          font-family: 'Special Elite';
          top: 3in;
          left: -0.75in;
          max-width: 50%;
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

              <p>#{ self.letter.letter_body }</p>
              <p>Sincerely,</p>
              <p class='signature'>#{ self.from_name }</p>
            </div>
          </div>
        </div>
      </body>
    </html>"
  end

end
