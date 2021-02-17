#!/usr/bin/env python

import sys
from app.maintainability import MaintainabilityTest

results = []
results.append(MaintainabilityTest().test())

if not all(results):
    sys.exit(1)
