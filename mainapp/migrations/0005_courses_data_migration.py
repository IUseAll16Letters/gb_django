
from django.db import migrations


def forward_func(apps, schema_editor):
    Courses = apps.get_model('mainapp', 'Courses')
    courses_data = (
        (
            'Web Python',
            'Курс Web Python поможет Вам осовоить язык программирования Python, а также разобраться с его основными '
            'аспектами, такими как: модули, парсеры, регулярные выражения. Курс поможет Вам научиться составлять '
            'эффективные программы для решения Ваших задач и проблем. Он научит Вас создавать собственные веб-приложения '
            'для работы с базами данных и сайтами. Вы сможете использовать Python для изучения Java, Ruby, PHP, C, C ++, '
            'C # или любого другого языка программирования.\r\nНа курсе Web Python проходит изучение веб-фреймворков '
            'Django, Bootstrap и Flask.\r\nВо втором семестре вы изучите такие инструменты и методы, как:\r\n\r\n* PHP '
            'и MySql;\r\n* Работа с файлами DOC, EXCEL, PATH;\r\n* Реляционная и объектная модель базы данных;\r\n* '
            'Создание и управление пакетами;\r\n* Как работать с FTP сервером;\r\n* Настройка среды и создание сайтов;'
            '\r\n* Веб-серверы;\r\n* Конфигурационное управление в Unix и Windows;\r\n* Инструменты для создания сайта;'
            '\r\n* Интеграция внешних приложений;\r\n* Расширения;',
            True,
            10000.50,
            'img/course001.jpg',
            '2021-07-11T08:24:53.084Z',
            '2021-07-11T09:06:35.322Z'
        ),
        (
            'Web Golang',
            'На курсе Web Golang вы изучите основы Go, получите практические навыки реализации проектов на Golang и '
            'научитесь работать в распределенных средах разработки. Вы узнаете: что такое Go как компилировать код '
            'Go как писать тесты как работает веб-сервер. Курс ведет Виктор Иванов\r\nСертифицированный специалист '
            'Google Developer Expert (Certified Technical Professional).\r\nАвтор учебника “Web-разработка на Go”. '
            'На курсе вы будете изучать основы языка программирования Go и получите практический опыт реализации '
            'проектов на Go.',
            True,
            9009.99,
            'img/course002.jpg',
            '2021-07-11T08:28:07.397Z',
            '2021-07-11T09:06:40.127Z'
         ),
        (
            'Web JavaScript',
            'Курс JavaScript ведёт преподаватель Дмитрий Кокшаров. Он преподает в разных вузах, в том числе и в МФТИ. '
            'Дмитрий считает, что курс — это база знаний, которая пригодится в жизни. \r\nКурс JavaScript состоит из '
            'модулей, один из которых — «Основы функционального программирования». Этот модуль рассчитан на тех, кто не '
            'знает основы JavaScript или только начал заниматься этим языком. Вы узнаете, как устроены функции, какие '
            'бывают типы данных, как применять модификаторы.\r\nНа курсе JavaScript Вы изучите:\r\n\r\n* Основные '
            'паттерны проектирования (design patterns) \r\n* Разработку на чистом JavaScript\r\n* ReactJS и AngularJS'
            '\r\n* ООП на JavaScript \r\n* Основы HTML 5 и CSS3\r\n* Javascript ES6 и ES7\r\n* Основы кроссбраузерные'
            '\r\n\r\nВы погрузитесь в динамичный мир современного JS-разработки, который станет интересным и '
            'увлекательным. Курс JavaScript будет полезен как новичкам, так и опытным разработчикам, желающим '
            'изучить новые технологии и получить новые знания.',
            True,
            2500.15,
            'img/course003.jpg',
            '2021-07-11T08:31:20.301Z',
            '2021-07-11T09:06:46.902Z'
        ),
        (
            'Web Java',
            'На курсе Java Вы изучите язык и фреймворк Java с самых азов до продвинутого уровня.\r\nА главное — '
            'Вы получите теоретические и практические навыки для создания, отладки, тестирования своих программ. '
            'В итоге Вы сможете выполнить проекты любой степени сложности, используя различные среды разработки и '
            'инструменты: от Eclipse IDE до IntelliJ IDEA, не говоря уже о современных облачных решениях от Google '
            'и GitHub.\r\nКурс Java ведёт сильный преподаватель Дмитрий. Дмитрий - это живой пример профессионального, '
            'увлеченного и целеустремленного преподавателя. С первых занятий, уже на первом уроке можно понять, '
            'что преподаватель очень заинтересован в том чтобы его ученики не просто получили теоретические знания, '
            'а приобрели практические навыки.',
            False,
            10000.00,
            'img/course004.jpg',
            '2021-07-11T08:34:10.771Z',
            '2021-07-11T09:06:52.015Z'
         ),
        (
            'Web PHP',
            'На курсе PHP Вы изучите основы PHP и получите навыки работы с PHP, такими как работа с базами данных, '
            'работа с графикой, создание сайтов, работа в PHPEdit, обработка исключений, управление памятью,'
            'работа со строками, работа с файлами. Курс PHP позволяет получить навыки программирования на языке PHP. '
            'После прохождения курса Вы сможете создавать собственный веб-сайт с системой управления, а так же применять '
            'свои знания для создания полноценных информационных систем.\r\nКурс PHP ведёт разработчик из «Сбербанка», '
            'который умеет делать сложные вещи из простых. Он рассказывает, как сделать сайт, не имея ничего, кроме '
            'базовых знаний — и делится секретами, за которые в других сферах с радостью уволили бы. У меня было '
            'достаточно времени, чтобы посмотреть на PHP с нуля и понять, что он крутой. Как-то раз меня спросили, '
            'почему я не пишу код сам, а только консультирую других. Я ответил: «Потому что мне нравится помогать '
            'людям». Но для этого нужно уметь всё.\r\nPHP — это сложная штука.',
            False,
            9500.78,
            'img/course005.jpg',
            '2021-07-11T08:36:21.087Z',
            '2021-07-11T09:06:57.580Z'
        ),
        (
            'Python AI',
            'На курсе Python AI Вы изучите создание простых нейросетей для задач машинного зрения.\r\nА также '
            'научитесь создавать и развивать более сложные нейросети.\r\nКурс рассчитан на:\r\n\r\n* Для тех, '
            'кому интересен мир машинного обучения, создания ИИ и робототехники.\r\n* Для специалистов в '
            'области физики, математики, программирования на Python.\r\n* Для всех, кто хочет прокачать свои '
            'навыки в Python, а также понять алгоритм работы нейронных сетей и научиться применять их на '
            'практике.\r\n\r\nКурс Python AI ведёт преподаватель школы "Фабрика Открытий" Денис Мигачёв.\r\n'
            'Он изучает математику и IT, много программирует и делает игры. Денис расскажет вам про инструменты, '
            'которые пригодятся для создания ИИ, и даст практические задания — напишите свою игру на Python.',
            True,
            6660.66,
            'img/course006.jpg',
            '2021-07-11T08:39:15.369Z',
            '2021-07-11T09:07:04.253Z'),
        (
            'DevOps',
            'На курсе DevOps Вы изучите основы автоматизации с Python, Git, Docker и узнаете про GitHub, '
            'Jenkins и Kubernetes. Узнаете, как все это работает, и поймете, зачем вам все это нужно.\r\n'
            'Курс состоит из 12 онлайн-семинаров, длительностью 90 минут. Он подходит опытным программистам, '
            'которые хотят усовершенствовать свои навыки в области управления проектами.\r\nНа курсе Вы изучите:'
            '\r\n\r\n* Основные возможности и функции Git\r\n* Как создавать, добавлять и удалять ветки, '
            'коммиты и тэги\r\n* Как использовать ветку и как ее можно назвать',
            True, '7770.77', 'img/course007.jpg', '2021-07-11T08:40:33.347Z', '2021-07-11T09:07:11.184Z'
        ),
        (
            '3D-моделирование',
            'Курс 3D-моделирования ведёт практикующий архитектор с высшим архитектурным образованием, со '
            'стажем преподавания более 7 лет.\r\nНа курсе 3D-моделирования Вы изучите программы:\r\n\r\n* '
            '3D-Max\r\n* Blender\r\n* Rhino\r\n* Maya\r\n* AutoCAD (V-Ray)\r\n\r\nНа курсе Вы научитесь:'
            '\r\n\r\n1. Создавать модели для разработки приложений.\r\n2. Создавать дизайн мебели.\r\n3. '
            'Создавать реалистичные текстуры и освещение.\r\n4. Создавать анимации.\r\n5. Настраивать рабочий '
            'процесс в программах.\r\n6. Уметь работать с 3D Studio Max, Blender, Rhinoceros.\r\n7. Уметь '
            'использовать инструменты программы AutoCAD.\r\n8. Уметь создавать свои собственные проекты или '
            'адаптировать модели 3D программ под свои нужды.',
            True,
            '5900.00',
            'img/no_image.svg',
            '2021-07-11T08:58:28.830Z',
            '2021-07-11T09:07:16.651Z'
        ),
    )
    Courses.objects.bulk_create(
        [Courses(
            id=idx,
            name=course[0],
            description=course[1],
            description_as_md=course[2],
            cost=course[3],
            image=course[4],
        )
            for idx, course in enumerate(courses_data, 1)]
    )


def reverse_func(apps, schema_editor):
    Courses = apps.get_model('mainapp', 'Courses')
    Courses.objects.all().delete()


class Migration(migrations.Migration):
    dependencies = [
        ('mainapp', '0004_created_news')
    ]

    operations = [
        migrations.RunPython(forward_func, reverse_func)
    ]
