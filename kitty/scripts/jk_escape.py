from time import time

from kitty.boss import get_boss  # pyright: ignore[]

last_j_time = 0


def main(args):
    global last_j_time
    now = time()
    if args[0] == "j":
        last_j_time = now
    elif args[0] == "k" and now - last_j_time < 0.25:
        w = get_boss().active_window
        if w is not None:
            w.write_to_child(b"\x1b")
        last_j_time = 0
