#!/usr/bin/env python

import sys
import logging
from app.maintainability import MaintainabilityTest

logging.basicConfig(
        level=logging.DEBUG,
        format='%(asctime)s %(levelname)-8s %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S')

results = []
results.append(MaintainabilityTest().test())

if not all(results):
    logging.error('Tests failed')
    sys.exit(1)

logging.info('Tests passed')