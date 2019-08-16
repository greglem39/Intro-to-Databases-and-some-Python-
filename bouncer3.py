import datetime
from dateutil.relativedelta import relativedelta

today = datetime.date.today()

bday_input = input('Enter birthday in mm/dd/year format: ')
month, day, year = bday_input.split('/')

bday = datetime.date(int(year), int(month), int(day))

diff = relativedelta(today, bday)

if diff.years >= 21:
    print('Welcome!')
    print('Stamp hand.')
else:
    print('Piss off kid!')
if diff.days ==0:
   print('Happy birthday!')

print('Next!')

