from benchit import BenchIt
from time import sleep


def demo_benchmark():
    b = BenchIt() # starts the timer

    # do stuff
    sleep(1); b()

    sleep(.2)
    sleep(.3)
    sleep(.4)
    b("More stuff Done")

    for i in range(1, 5):
      sleep(.1); b()

    b.display()


demo_benchmark()
