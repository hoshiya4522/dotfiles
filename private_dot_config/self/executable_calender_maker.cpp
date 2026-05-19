#include <fstream>
#include <iostream>
#include <string>
using namespace std;

// Source - https://stackoverflow.com/a/53155217
// Posted by kks21199, modified by community. See post 'Timeline' for change history
// Retrieved 2026-03-13, License - CC BY-SA 4.0
int dayofweek(int d, int m, int y) 
{ 
    static int t[] = { 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 }; 
    y -= m < 3; 
    return ( y + y/4 - y/100 + y/400 + t[m-1] + d) % 7; 
} 

int max_days(int month, int year){
	int days_per_month[] = {31,0,31,30,31,30,31,31,30,31,30,31};
	if (month != 2 )
		return days_per_month[month-1];

	if (year % 400 == 0 || year % 4 == 0 && year % 100 != 0 )
		return 29;

	return 28;
}

int main(int argc, char* argv[]){
	string days[] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
	string months[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

	int month=1, date=1, week=1, day, year;
	cout << "Enter Year: ";
	cin >> year;

	ofstream output("calendar-" + to_string(year) + ".txt");

	// 2026-1-01 w01 Thu	
	for (month=1; month<=12; month++){
		int max_date = max_days(month, year);

		output << months[month-1] << " " << year << endl;
		output << "------------------" << endl;

		for (date=1; date<=max_date; date++) {
			day = dayofweek(date, month, year);

			output << year << "-";

			if (month < 10) 
				output << 0;
			output << month << "-";

			if (date < 10) 
				output << 0;
			output << date << " w";

			if (week < 10) 
				output << 0;
			output << week;
			if (day == 5)
				week++;

			output << " " << days[day];

			output << "\t" << endl;
		}
		output << endl;
	}

	return 0;
}
