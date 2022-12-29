__all__ = ['parse_log_file']

from django.conf import settings


def parse_log_file(logger, lines: int = 1000, tail: int = True):
    with open(settings.LOG_FILE, 'rb') as log:
        try:
            if tail:
                current = 1
                file_len = log.seek(current, 2)

                while lines and abs(current) < file_len:
                    log.seek(current, 2)
                    byte_data = log.read(1)
                    if byte_data == b'\n':
                        lines -= 1
                    current -= 1
            else:
                return b''.join(log.readline() for _ in range(lines))

        except OSError as err:
            logger.warn(msg=f'{err}, {current = } {lines = }')
        return log.read()
