__all__ = ('deprecated_function', )

from functools import wraps


def deprecated_function(fnc):
    @wraps(fnc)
    def wrapper(*args, **kwargs):
        assert False, f'This method {fnc.__name__} is no longer used'
    return wrapper


def _main():
    def i_work():
        print('This function works!')

    @deprecated_function
    def i_not_work():
        print('If you see this message, things went terribly wrong!')

    i_work()
    try:
        i_not_work()
    except AssertionError:
        print("Not working function didn't work, hooray!")


if __name__ == '__main__':
    _main()
