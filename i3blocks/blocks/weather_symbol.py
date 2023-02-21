#!/usr/bin/python3
def print_weather_symbol(state):
    state=state.lower()
    if state == 'sunny' or state == 'clear' or state == 'partly cloudy':
        print('🌤')
    if state == 'equals' or state == 'overcast':
        print('☁')
    elif 'rain' in state:
        print('🌧')
    elif 'snow' in state:
        print('🌨')
    elif 'storm' in state:
        print('🌩')

if __name__ == '__main__':
    import sys
    print_weather_symbol(str(sys.argv[1]))
