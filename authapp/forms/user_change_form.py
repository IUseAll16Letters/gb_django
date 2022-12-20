__all__ = ['CustomUserChangeForm']

import os

from django.forms import ModelForm
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UsernameField
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _


class CustomUserChangeForm(ModelForm):
    class Meta:
        model = get_user_model()
        fields = (
            "username",
            "email",
            "first_name",
            "last_name",
            "age",
            "avatar",
        )
        field_classes = {"username": UsernameField}

    def clean_avatar(self, arg_as_str="avatar"):
        print(arg_as_str)
        print(self.instance)
        print(self.instance.avatar)
        print(self.instance.avatar.path)
        if arg_as_str in self.changed_data and self.instance.avatar:
            if os.path.exists(self.instance.avatar.path):
                os.remove(self.instance.avatar.path)
        return self.cleaned_data.get(arg_as_str)

    def clean_age(self):
        data = self.cleaned_data.get("age")
        if data < 10 or data > 100:
            raise ValidationError(_("Please enter a valid age (10, 100)!"))
        return data

