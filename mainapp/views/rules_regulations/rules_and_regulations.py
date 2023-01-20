__all__ = ('RulesRegulationsView', )

from django.views.generic import TemplateView


class RulesRegulationsView(TemplateView):
    template_name = 'mainapp/rules_and_regulations.html'
