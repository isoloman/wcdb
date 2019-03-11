/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <WCDB/WCTConvertible.h>

namespace WCDB {

ColumnTypeInfo<ColumnType::Text>::UnderlyingType
ColumnIsTextType<NSString*>::asUnderlyingType(NSString* text)
{
    return WCDB::UnsafeString(text.UTF8String, [text lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
}

ColumnTypeInfo<ColumnType::Float>::UnderlyingType
ColumnIsFloatType<NSNumber*>::asUnderlyingType(NSNumber* number)
{
    return number.doubleValue;
}

const UnsafeData UnsafeData::Convertible<NSData*>::asUnsafeData(NSData* data)
{
    return UnsafeData((unsigned char*) data.bytes, (size_t) data.length);
}

Expression ExpressionConvertible<WCTProperty>::asExpression(const WCTProperty& property)
{
    return Expression((const WCDB::Column&) property);
}

IndexedColumn IndexedColumnConvertible<WCTProperty>::asIndexedColumn(const WCTProperty& property)
{
    return Expression((const WCDB::Column&) property);
}

LiteralValue LiteralValueConvertible<NSNumber*>::asLiteralValue(NSNumber* number)
{
    return LiteralValue(number.doubleValue);
}

#if OBJC_BOOL_IS_CHAR
LiteralValue LiteralValueConvertible<BOOL>::asLiteralValue(BOOL value)
{
    return LiteralValue((bool) value);
}
#endif // OBJC_BOOL_IS_CHAR

}
