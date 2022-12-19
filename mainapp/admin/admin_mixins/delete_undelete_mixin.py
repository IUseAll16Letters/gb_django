__all__ = ["DeleteUndeleteMixin"]

from django.contrib import messages
from django.utils.translation import gettext_lazy as _


class DeleteUndeleteMixin:

    def mark_deleted(self, request, queryset):
        print(f'{request = }')
        print(f'{queryset = }')
        count = queryset.update(deleted=True)
        message = _(f"Delete lessons, {count}")
        messages.add_message(request, messages.INFO, message)

    def un_delete(self, request, queryset):
        print(f'{request = }')
        print(f'{queryset = }')
        count = queryset.update(deleted=False)
        message = _(f"Unmark deleted, {count}")
        messages.add_message(request, messages.INFO, message)

    mark_deleted.short_description = _("Mark as deleted")
    un_delete.short_description = _("Remove deletion")
