/**
 * (C) Copyright IBM Corp. 2018, 2019.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

/**
 Object describing the current status of the wordlist.
 */
public struct TokenDictStatusResponse: Codable, Equatable {

    /**
     Current wordlist status for the specified collection.
     */
    public enum Status: String {
        case active = "active"
        case pending = "pending"
        case notFound = "not found"
    }

    /**
     Current wordlist status for the specified collection.
     */
    public var status: String?

    /**
     The type for this wordlist. Can be `tokenization_dictionary` or `stopwords`.
     */
    public var type: String?

    // Map each property name to the key that shall be used for encoding/decoding.
    private enum CodingKeys: String, CodingKey {
        case status = "status"
        case type = "type"
    }

}
