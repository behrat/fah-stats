# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class Team(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=765, null=True, blank=True)
    score = models.BigIntegerField()
    units = models.IntegerField()
    class Meta:
        db_table = u'team'

class User(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=765)
    score = models.BigIntegerField()
    units = models.IntegerField()
    team = models.ForeignKey(Team, db_column='team')
    class Meta:
        db_table = u'user'

