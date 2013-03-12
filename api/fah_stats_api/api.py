from tastypie.resources import ModelResource
from tastypie import fields
from fah_stats_api.models import *
from tastypie.constants import ALL, ALL_WITH_RELATIONS

class TeamResource(ModelResource):
    score = fields.IntegerField('score')

    class Meta:
        queryset = Team.objects.all()
        resource_name='teams'
        filtering = {
            "name": ALL,
            "score": ALL,
            "units": ALL,
            "user_count": ALL,
        }

    def dehydrate(self, bundle):
        bundle.data['rank'] = Team.objects.filter(score__gte=bundle.data['score']).count()
        bundle.data['percentile'] = round(100 * (1 - float(bundle.data['rank']-1) / Team.objects.count()), 4)
        bundle.data['user_count'] = User.objects.filter(team=bundle.obj).count()
        return bundle

class UserResource(ModelResource):
    team = fields.ForeignKey(TeamResource, 'team')
    score = fields.IntegerField('score')

    class Meta:
        queryset = User.objects.all()
        resource_name='users'
        filtering = {
            "name": ALL,
            "score": ALL,
            "units": ALL,
            "team": ALL,
        }

    def dehydrate(self, bundle):
        bundle.data['rank'] = User.objects.filter(score__gte=bundle.data['score']).count()
        bundle.data['percentile'] = round(100 * (1 - float(bundle.data['rank']-1) / User.objects.count()), 6)
        return bundle
