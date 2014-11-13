#!/usr/bin/env python
# -*- coding: utf-8 -*-
#  Copyright 2000-2014 4AM tech, Inc. All rights reserved.
#  +-----------------------------------------------------------------+
#  | THIS SOFTWARE IS FURNISHED UNDER A LICENSE AND MAY ONLY BE USED |
#  | AND COPIED IN ACCORDANCE WITH THE TERMS AND CONDITIONS OF SUCH  |
#  | A LICENSE AND WITH THE INCLUSION OF THE THIS COPY RIGHT NOTICE. |
#  | THIS SOFTWARE OR ANY OTHER COPIES OF THIS SOFTWARE MAY NOT BE   |
#  | PROVIDED OR OTHERWISE MADE AVAILABLE TO ANY OTHER PERSON. THE   |
#  | OWNERSHIP AND TITLE OF THIS SOFTWARE IS NOT TRANSFERRED.        |
#  |                                                                 |
#  | THE INFORMATION IN THIS SOFTWARE IS SUBJECT TO CHANGE WITHOUT   |
#  | ANY PRIOR NOTICE AND SHOULD NOT BE CONSTRUED AS A COMMITMENT BY |
#  | VIVOTEK INC.                                                    |
#  +-----------------------------------------------------------------+
#  -------------------------------------------------------------------
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import re
import os
import pdb
import traceback
import logging
import time
import datetime
import json
# Third-party modules
from awesome_print import ap
from ish_parser import ish_parser
from ish_report import ish_report, ish_reportException
# Load custom modules
# -----------------------------------------------------------------

def setup_logging(logging_file_path="log/stdout.log"):
    log_dir = os.path.dirname(os.path.realpath(logging_file_path))
    if not os.path.isdir(log_dir):
        os.makedirs(log_dir)  # it can built folder tree in one call

    logging.basicConfig(filename=logging_file_path, level=logging.DEBUG)
    logging.getLogger().addHandler(logging.StreamHandler())
    logging.info("{0} starts".format(__file__))

def get_precipitation(report):
    if report.precipitation:
        return [report.precipitation[0]["hours"],report.precipitation[0]["depth"].MILLIMETERS]
    else:
        return ["null","null"]

def main():
    try:
        SAMPLE_FILE = '999999-94996-2014.min'
        export_weather_list = []
        setup_logging()
        with open(SAMPLE_FILE) as fp:
            content = fp.read()
        wp = ish_parser()
        wp.loads(content)
        try:
            reports = wp.get_reports()
        except BaseException  as e:
            pass
        for (i, report) in enumerate(reports):
            precip_hour, precip_depth = get_precipitation(report)
            current_weather = {
                "report_type": str(report.report_type),
                "latitude": str(report.latitude),
                "longitude": str(report.longitude),
                "datetime": str(report.datetime),
                "air_temperature": str(report.air_temperature),
                "wban": str(report.wban),
                "weather_station": str(report.weather_station),
                "sea_level_pressure": str(report.sea_level_pressure),
                "dew_point_temperature": str(report.dew_point_temperature),
                "elevation": str(report.elevation),
                "visibility_distance": str(report.visibility_distance),
                "precipitation_hour": str(precip_hour),
                "precipitation_depth_in_mm": str(precip_depth)
            }
            export_weather_list.append(current_weather)
        with open('sample_weather.json', 'w') as f:
            json.dump(export_weather_list, f)

    except BaseException as e:
        traceback.print_exc(file=sys.stdout)
        pdb.set_trace()
        print(e)

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    start_time = datetime.datetime.now()
    main()
    elapsed = datetime.datetime.now() - start_time
    print("Finished this task in  : {0} ".format(elapsed))

